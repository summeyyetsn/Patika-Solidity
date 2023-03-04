// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

contract Tweether {

    /*
    Tweether struct{}
    Tweet[] tweets
    createTweet()
    getTweet()
    getReplice()
    likeTweet()
    deleteTweet()
    getTotalTweet()
    */
    struct Tweet{
        uint tweetId;   
        address tweetOwner;
        uint tweetLikes;
        mapping (address => bool) likedBy;
        string tweetContent;
        uint createAt;
        uint[] replies;
        bool isReply;
        uint repliedTo;
    }
    uint public lastTweetId;

    constructor() {
        lastTweetId = 0;
    }

    Tweet[] private tweets;

    function createTweet(string memory _tweetContent, uint _repliedTo, bool _isReply) public returns(uint) {
        Tweet storage tweet = tweets.push();

        tweet.tweetId = lastTweetId;
        tweet.tweetOwner = msg.sender;
        tweet.tweetContent = _tweetContent;
        tweet.createAt = block.timestamp;
        tweet.isReply = _isReply;
        tweet.repliedTo = _repliedTo;

        if(_isReply == true && _repliedTo >= 0){
            tweets[_repliedTo].replies.push(lastTweetId);
        }

        lastTweetId += 1;
        return (lastTweetId -1 );
    }

    function getTweet(uint _tweetId) public view returns( uint, address, uint[] memory, uint, bool,string memory, uint, bool, uint)
    {                                                         
        Tweet storage tweet = tweets[_tweetId];

        return(tweet.tweetId,
        tweet.tweetOwner, 
        tweet.replies, 
        tweet.tweetLikes, 
        tweet.likedBy[msg.sender], 
        tweet.tweetContent, 
        tweet.createAt, 
        tweet.isReply, 
        tweet.repliedTo);
    }

    function getReplice(uint _tweetId) public view returns(uint[] memory) {

        return tweets[_tweetId].replies;
    }

    function likeTweet(uint _tweetId) public returns(bool){
        if(tweets[_tweetId].likedBy[msg.sender] == true){
            tweets[_tweetId].tweetLikes -= 1;
        }
        else{
            tweets[_tweetId].tweetLikes += 1;
        }
        tweets[_tweetId].likedBy[msg.sender] = !tweets[_tweetId].likedBy[msg.sender];
        return tweets[_tweetId].likedBy[msg.sender];
    }
    function deleteTweet(uint _tweetId) public returns(bool) {
        delete tweets[_tweetId];
        return true;
    }
    function getTotalTweet() public view returns(uint){
        return tweets.length;
    }
    
}