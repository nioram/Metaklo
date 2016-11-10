
<?php

$inMsg = $argv[1];

echo "Sending $inMsg";

require_once 'twitter-php/src/twitter.class.php';

$consumerKey="XXX";

$consumerSecret="XXX";

$accessToken="XXX";

$accessTokenSecret="XXX";

$twitter = new Twitter($consumerKey, $consumerSecret, $accessToken, $accessTokenSecret); try { $tweet =

$twitter->send("$inMsg");

} catch (TwitterException $e) {
echo 'Error: ' . $e->getMessage();
}

?>
