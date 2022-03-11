# ldcircleci/dotnet6-release

This is an Ubuntu 20.04 image with the following tools for LaunchDarkly .NET releases:

* The .NET 6.0 SDK, which can build code for all .NET platforms except for Xamarin. The `PATH` includes the `dotnet` command.
* The [osslsigncode](https://github.com/mtrojnar/osslsigncode) tool, for Authenticode signing (Microsoft's `signtool.exe` isn't available for Linux, and Mono's `signtool` doesn't work properly with our certificate).
* The [DocFX](https://dotnet.github.io/docfx/) tool for generating HTML documentation from in-code doc comments. The `PATH` includes the `docfx` command. This image currently uses a prerelease version of DocFX 3.0; previous DocFX versions did not work with .NET 6.0 and had to be run via Mono.
