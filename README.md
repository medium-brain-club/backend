[![Build Status](https://drone.byteporter.com/api/badges/good-brain-thinkins/backend/status.svg)](https://drone.byteporter.com/good-brain-thinkins/backend)

# Backend

This is the CRUD API for storing data for the mental health hackathon project.

The repository I've been working out of is at <https://gitea.byteporter.com/good-brain-thinkins/backend>,
which is my self-hosted git repository. I've used it because I have continuous integration set up using
Drone-CI already, and have a personal preference for controlling my own tools when it makes sense.

This repository is mirrored on GitHub to provide the public with a more familiar way to interact and also
for integration with the rest of the team's effort. The mirror is available at <https://github.com/medium-brain-club/backend>.

## Tags

- v1.0 - Code as submitted at end of hackathon.

## Resources

- /api/tags
    - GET: `curl -v -w'\n' -s https://backend.byteporter.com/api/tags`
    - POST: `curl -v -w'\n' -s -X POST -d '[ { "Name": "Tag1" }, { "Name": "Tag2" } ]' https://backend.byteporter.com/api/tags`

- /api/messages
    - GET: `curl -v -w'\n' -s https://backend.byteporter.com/api/messages`
    - POST: `curl -v -w'\n' -s -X POST -d '[ { "Title": "A post title", "Body": "A post body" } ]' https://backend.byteporter.com/api/messages`
