# Sendgrid

## Required Features

### Send Email With Text and Html Bodies

Using the mail send api https://docs.sendgrid.com/api-reference/mail-send/mail-send

### Send Email With Attachments

Using the mail send api https://docs.sendgrid.com/api-reference/mail-send/mail-send
```python
message.attachment = [
    Attachment(
        file_content=FileContent("PCFET0NUWVBFIGh0bWw+CjxodG1sIGxhbmc9ImVuIj4KCiAgICA8aGVhZD4KICAgICAgICA8bWV0YSBjaGFyc2V0PSJVVEYtOCI+CiAgICAgICAgPG1ldGEgaHR0cC1lcXVpdj0iWC1VQS1Db21wYXRpYmxlIiBjb250ZW50PSJJRT1lZGdlIj4KICAgICAgICA8bWV0YSBuYW1lPSJ2aWV3cG9ydCIgY29udGVudD0id2lkdGg9ZGV2aWNlLXdpZHRoLCBpbml0aWFsLXNjYWxlPTEuMCI+CiAgICAgICAgPHRpdGxlPkRvY3VtZW50PC90aXRsZT4KICAgIDwvaGVhZD4KCiAgICA8Ym9keT4KCiAgICA8L2JvZHk+Cgo8L2h0bWw+Cg=="),
        file_name=FileName("index.html"),
        file_type=FileType("text/html"),
        disposition=Disposition("attachment")
    )
]
```

### Send Email With Templates

https://docs.sendgrid.com/ui/sending-email/how-to-send-an-email-with-dynamic-transactional-templates

### Track Email Events

```python
message.tracking_settings = TrackingSettings(
    click_tracking=ClickTracking(
        enable=True,
        enable_text=False
    ),
    open_tracking=OpenTracking(
        enable=True,
        substitution_tag=OpenTrackingSubstitutionTag("%open-track%")
    ),
    subscription_tracking=SubscriptionTracking(False)
)
```

### Schedule Email Messages

Add send at with a timestamp

```python
message.send_at = SendAt(1617260400)
```
