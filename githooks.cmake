### Set the hook's name
set(GIT_PRE_RELEASE_HOOK_FILE "${PROJECT_SOURCE_DIR}/.git/hooks/pre-release.sh")

### Set the hook's content
set(GIT_PRE_RELEASE_HOOK_FILE_CONTENT 
"#!/bin/sh

echo Put your foobar-hook-content here.
echo (Take care of your backslashes)
")

if(EXISTS ${GIT_PRE_RELEASE_HOOK_FILE})
    message("-- git pre-release hook exists")
else()
    file(WRITE
        ${GIT_PRE_RELEASE_HOOK_FILE}
        ${GIT_PRE_RELEASE_HOOK_FILE_CONTENT}
    )
endif()

if(EXISTS ${GIT_PRE_RELEASE_HOOK_FILE})
    message("-- git pre-release hook created.")
else()
    message("-- creating git hook failed.")
endif()

## Warning: this is not portable!
execute_process(
    COMMAND             chmod a+x ${GIT_PRE_RELEASE_HOOK_FILE}
    WORKING_DIRECTORY   ${PROJECT_SOURCE_DIR}/.git/hooks/
    OUTPUT_QUIET
    ERROR_QUIET
)