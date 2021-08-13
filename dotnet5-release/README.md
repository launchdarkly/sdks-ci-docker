# ldcircleci/dotnet5-release

This is an Ubuntu 20.04 image with the following tools for LaunchDarkly .NET releases:

* The .NET 5.0 SDK, which can build code for all .NET platforms except for Xamarin. The `PATH` includes the `dotnet` command.
* The Mono SDK, a somewhat different distribution of the Linux .NET build tools; we don't need Mono for compiling our own code, but it is currently needed in order to run DocFX. The `PATH` also includes the `mono` command.
* The [osslsigncode](https://github.com/mtrojnar/osslsigncode) tool, for Authenticode signing (Microsoft's `signtool.exe` isn't available for Linux, and Mono's `signtool` doesn't work properly with our certificate).
* The [DocFX](https://dotnet.github.io/docfx/) tool for generating HTML documentation from in-code doc comments. The `PATH` includes the `docfx` command.
