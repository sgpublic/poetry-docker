dependencyResolutionManagement {
    // Reuse version catalog from the main build.
    versionCatalogs {
        create("libs") { from(files("../gradle/poetry.versions.toml")) }
    }
}