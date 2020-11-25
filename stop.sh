ps #!/bin/bash

# should be called to stop the applications

kill "$(cat MOVES_WEB_PID)"
kill "$(cat MOVES_REST_PID)"
rm MOVES_WEB_PID MOVES_REST_PID
