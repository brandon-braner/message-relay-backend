# Mailgun

## Required Features

### Send Email With Text and Html Bodies

This can be accomplished by using the Mailgun api and adding the
`-F text="text email` and the `--form-string html="html email`

```
requests.post("https://api.mailgun.net/v3/YOUR_DOMAIN_NAME/messages",
auth=("api", "YOUR_API_KEY"),
data={"from": "Excited User <mailgun@YOUR_DOMAIN_NAME>",
      "to": ["bar@example.com", "YOU@YOUR_DOMAIN_NAME"],
      "subject": "Hello",
      "text": "Testing some Mailgun awesomness!"})
```

### Send Email With Attachments

Add attachments to the email by adding the following to the curl command:
```
requests.post(
        "https://api.mailgun.net/v3/YOUR_DOMAIN_NAME/messages",
        auth=("api", "YOUR_API_KEY"),
        files=[("attachment", ("test.jpg", open("files/test.jpg","rb").read())),
               ("attachment", ("test.txt", open("files/test.txt","rb").read()))],
        data={"from": "Excited User <YOU@YOUR_DOMAIN_NAME>",
              "to": "foo@example.com",
              "cc": "baz@example.com",
              "bcc": "bar@example.com",
              "subject": "Hello",
              "text": "Testing some Mailgun awesomness!",
              "html": "<html>HTML version of the body</html>"})
```

### Send Email With Templates

```
requests.post(
        "https://api.mailgun.net/v3/YOUR_DOMAIN_NAME/messages",
        auth=("api", "YOUR_API_KEY"),
        data={"from": "Excited User <YOU@YOUR_DOMAIN_NAME>",
              "to": ["alice@example.com, bob@example.com"],
              "subject": "Hey, %recipient.first%",
              "text": "If you wish to unsubscribe, click http://mailgun/unsubscribe/%recipient.id%'",
              "recipient-variables": ('{"bob@example.com": {"first":"Bob", "id":1}, '
                                      '"alice@example.com": {"first":"Alice", "id": 2}}')})
```

### Track Email Events

Add the following to the data to turn on tracking

```
"o:tracking": True
```

### Schedule Email Messages

Set a time in GMT/UTC format or timestamp

```
"o:deliverytime": "Fri, 25 Oct 2011 23:10:10 -0000"
```
