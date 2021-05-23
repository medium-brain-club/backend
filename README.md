[![Build Status](https://drone.byteporter.com/api/badges/good-brain-thinkins/backend/status.svg)](https://drone.byteporter.com/good-brain-thinkins/backend)

# Backend

This is the CRUD API for storing data for the mental health hackathon project.

## Resources

- /api/tags
    - GET: `curl -v -w'\n' -s https://backend.byteporter.com/api/tags`
    - POST: `curl -v -w'\n' -s -X POST -d '[ { "Name": "Tag1" }, { "Name": "Tag2" } ]' https://backend.byteporter.com/api/tags`

- /api/messages
    - GET: `curl -v -w'\n' -s https://backend.byteporter.com/api/messages`
    - POST: `curl -v -w'\n' -s -X POST -d '[ { "Title": "A post title", "Body": "A post body" } ]' https://backend.byteporter.com/api/messages`
