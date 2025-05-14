file(GLOB RESOURCES_FILES ${CMAKE_CURRENT_SOURCE_DIR}/resources/images/*)
target_sources(app PRIVATE ${RESOURCES_FILES})
