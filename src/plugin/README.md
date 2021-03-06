The purpose of the plugins is to make use the model generated by **SCAM** tool, starting from the *Electronic System Level* (ESL), and give a meaningful output to the end
user in a syntax defined by them.

The model generated by **SCAM** contains the entire structure of the ESL reorganized in a TopInstance and its submodules with all the ports, variables, functions and FSM
of each of them. Starting from this model, the end user (plugin designer) can create a useful output like generating ITL properties or VHDL representation for each
subModule and later prints this output either to the terminal or to a directory.

We will explain how to build a plugin through an example, **PrintTemplate**.


Plugin Class:
-------------

    #include <PluginFactory.h>
    #include "Model.h"

    class PrintTemplate : public PluginFactory, public AbstractVisitor {
    public:
        PrintTemplate() = default;
        ~PrintTemplate() = default;
        std::map<std::string, std::string> printModel(Model *node);

    private:
        void visit(Model &node) {};
        void visit(Module &node) {};
        void visit(Port &node) {};
        void visit(Variable &node) {};
        void visit(Function &node) {};
        void visit(Parameter &node) {};
        void visit(FSM &node) {};
        void visit(DataType &node) {};
        void visit(ModuleInstance &node) {};
        void visit(Channel &node) {};
        void visit(DataSignal &node) {};
        void visit(Interface &node) {};
    };

Inheriting from **PluginFactory** is necessary to include your plugin in the resulting **SCAM** binary. This **PluginFactory** class includes:

-   **pluginOutput** variable which holds a map of filenames to be created and their content (i.e. VHDL components or ITL properties for each module ... etc). These files
 will either be printed to the terminal or to a specific directory depending on the commandline input.

        std::map<std::string, std::string> pluginOutput;

-   **getOptionMap()** function which returns a map of your plugin commandline options and their status (True if an option was in the commandline input, False if not).

        std::map<std::string, bool> getOptionMap()

-   **printModel** function which will assign to the **pluginOutput** variable what files to be created and their corresponding contents. You must override this function
to create your own output. In the **PrintTemplate** plugin it looks like this:

        std::map<std::string, std::string> PrintTemplate::printModel(Model *node) {
            for (auto &module: node->getModules()) {
                std::stringstream result;
                result << "Generate the output you want\n";
                pluginOutput.insert(std::make_pair(module.first + ".txt", result.str()));
            }
            return pluginOutput;
        }

Inheriting from **AbstractVisitor** is optional. This class gives access to the model and all its components through overriding their corresponding *visit* functions like
 in the **PrintTemplate** example above.


Plugin Directory:
-----------------
- In the *CMakeLists.txt* file of your plugin you should add your plugin library:

        add_library(PrintTemplate
                    PrintTemplate.cpp
                    PrintTemplate.h)

    **NOTE**: make sure to name your plugin library with the same name of your plugin class.

- In case you want to change the format of the **SCAM** statements it's recommended that you create your own "statement" class and inherit from **PrintStmt** class.


Incorporating your Plugin:
--------------------------

In order to incorporate your plugin class and library in **SCAM** you need to add this plugin in the *CMakeLists.txt* file under *SCAM/src/plugin* directory. **SCAM**
provides two macros to help with this:

-   **add_plugin**: you can add your plugin, its description and its directory using this macro. for example:

        add_plugin(PrintMYStyle; "This plugin prints the model in MY style" ; MYStyleDirectory)

    Note: If plugin directory is not specified, it'll be assumed that plugin directory has the same name as the plugin itself.

-   **add_plugin_option**: you can add your plugin options and their descriptions using this macro. for example:

        add_plugin_option(MYStyle; Optimize; "This option prints the model in MY style after optimizing the structure")

    **NOTE** make sure to give the same name of your plugin to its class implementation


Plugin Usage:
-------------

After building **SCAM** successfully with your plugin included, it'll be possible to use your plugin through the commandline options associated with **SCAM**. for
 example:

    SCAM -f myInputFile.h -o <myOutputDirectory> -PrintMyStyle --Optimize

for more information run:

    SCAM -h