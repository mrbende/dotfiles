# Include image file in the build
file(GLOB RESOURCES_FILES resources/images/*)
target_sources(app PRIVATE ${RESOURCES_FILES})
