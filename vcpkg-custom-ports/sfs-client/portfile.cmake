# Either get from github, or use a locally available path

# vcpkg_from_github(
#     OUT_SOURCE_PATH SOURCE_PATH
#     REPO microsoft/sfs-client
#     REF 23b4d38abf02a7c3deadcce1674a3821e5809d72
#     SHA512 0
#     HEAD_REF user/arthuraraujo/install
# )

# Using local repo at D:/sfs-client. Use whatever makes sense
set(SOURCE_PATH D:/sfs-client)

if(VCPKG_TARGET_IS_WINDOWS)
    vcpkg_check_linkage(ONLY_STATIC_LIBRARY)
endif()

vcpkg_cmake_configure(SOURCE_PATH "${SOURCE_PATH}")
vcpkg_cmake_install()
vcpkg_fixup_pkgconfig()
vcpkg_cmake_config_fixup(PACKAGE_NAME sfsclient CONFIG_PATH lib/cmake/sfsclient)

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")

# Handle usage
file(COPY "${CMAKE_CURRENT_LIST_DIR}/usage" DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}")

# Remove duplicated include files
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
