    import qbs
    import qbs.Process
    import qbs.File
    import qbs.FileInfo
    import qbs.TextFile
    import "../../../libs/openFrameworksCompiled/project/qtcreator/ofApp.qbs" as ofApp

    Project{
        property string of_root: "../../.."

        ofApp {
            name: { return FileInfo.baseName(path) }

            files: [
                "src/main.cpp",
                "src/ofApp.cpp",
                "src/ofApp.hpp",
                "src/view.cpp",
                "src/view.hpp",
                "src/metabot.cpp",
                "src/metabot.hpp",
                "src/drone.cpp",
                "src/drone.hpp",
                "src/zonegrid.cpp",
                "src/zonegrid.hpp",
                "src/network.cpp",
                "src/network.hpp",
                "src/parameter.hpp",
            ]

            of.addons: [
                'ofxAssimpModelLoader',
                'ofxGui'
            ]

            // additional flags for the project. the of module sets some
            // flags by default to add the core libraries, search paths...
            // this flags can be augmented through the following properties:
            of.pkgConfigs: []       // list of additional system pkgs to include
            of.cFlags: []           // flags passed to the c compiler
            of.cxxFlags: ["-std=c++11"]         // flags passed to the c++ compiler
            of.linkerFlags: []      // flags passed to the linker
            of.defines: []          // defines are passed as -D to the compiler
                                    // and can be checked with #ifdef or #if in the code
            of.includePaths: [
                ".",
                "/opt/API/Headers"
            ]
            // other flags can be set through the cpp module: http://doc.qt.io/qbs/cpp-module.html
            // eg: this will enable ccache when compiling
            //
            // cpp.compilerWrapper: 'ccache'
            cpp.libraryPaths: ["/opt/build-api/Implementations/Jamoma"]
            cpp.dynamicLibraries: "APIJamoma"

            Depends{
                name: "cpp"
            }

            // common rules that parse the include search paths, core libraries...
            Depends{
                name: "of"
            }

            // dependency with the OF library
            Depends{
                name: "openFrameworks"
            }
        }

        references: [FileInfo.joinPaths(of_root, "/libs/openFrameworksCompiled/project/qtcreator/openFrameworks.qbs")]
    }
