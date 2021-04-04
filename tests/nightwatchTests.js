module.exports = {
    'Verify the colours header exists': function(browser) {
        browser
            .url('localhost:8080')
            .assert.containsText("#colours-header", "colours");
    }
}