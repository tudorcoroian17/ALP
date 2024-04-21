# ALP
Teaching materials for ALP at UTCN (1st year- 2nd semester)

# Setting up MASM/TASM extesion

In order to be able to run your code from multiple files (such as a main file, a procedure library and a macro library) we need to setup VS Code in a way that tells the assembler that we our code is split among multiple files.

## Step 1. Download a .ZIP of this repository
To ensure that the structure of your work folder is similar with the one from the repository, I encourage you to download the code from this repository in a `.zip` file.

To do this, go to [the main page](https://github.com/tudorcoroian17/ALP/tree/main) of the repository. Then click on `<> Code` and select `Download ZIP`.
![Download ZIP](/resources/imgs/step1a.jpg "Download the ZIP file")

After it has downloaded, extract the contents of the zip file on your desktop.
![Extract contents](/resources/imgs/step1b.jpg "Extract contents")
You should now see a folder called `ALP-main` on your desktop. Rename this folder to `ALP`.

## Step 2. Open the folder as a VSCode workspace
To open the folder as a VSCode workspace, you can first open the folder and type in the **path bar** the word `cmd` and press `ENTER`.
![Open cmd](/resources/imgs/step2a.jpg "Open command line")

The command line should open up. In it, type `code .` and press `ENTER`.
![Open VSCode](/resources/imgs/step2b.jpg "Open Visual Studio Code")

VSCode should now open. Select the option **Yes, I trust the authors**.
![Trust authors](/resources/imgs/step2c.jpg "Trust authors")

You should now close the command line, since we are not going to use it anymore.

## Step 3. Configuring `settings.json`

The `settings.json` file can be found inside the `.vscode` folder. 

### Run code from a single file
To run code from a single file, you simply need to add the following code inside your `settings.json` file. 

```json
{
    "masmtasm.ASM.emulator": "dosbox",
    "masmtasm.ASM.mode": "single file",
    "masmtasm.ASM.actions": {
        "TASM": {
            "baseBundle": "<built-in>/TASM.jsdos",
            "before": [
                "set PATH=C:\\TASM",
            ],
            "run": [
                "TASM /m2 ${file}",
                "TLINK ${filename}",
                ">${filename}"
            ],
            "debug": [
                "TASM /m2 /zi ${file} ${filename}.obj",
                "TLINK /v/3 ${filename}.obj",
                "TD ${filename}.exe"
            ]
        }
    },
    "masmtasm.ASM.assembler": "TASM"
}
```

### Run code from multiple files
In order to run code from multiple files, we need to change a few options inside the `settings.json` file.

#### Switch from `single file` to `workspace`
For this step, simply replace the `single file` option with `workspace`

```json
{
    ...
    "masmtasm.ASM.mode": "workspace",
    ...
}
```

#### Add the path to current directory
Since we are working with the whole workspace, everything will be mounted on the `D:\` partition inside **DOSBox**. Thus, we need to add an instruction in the `before` directive of the `TASM` entry in `masmtasm.ASM.actions`.

```json
{
    ...
    "masmtasm.ASM.actions": {
        "TASM": {
            ...
            "before": [
                "set PATH=C:\\TASM",
                "cd D:\\Lab_09"
            ],
            ...
    },
    ...
}
```

The new instruction `cd D:\\Lab_09` tells DOSBox to move inside the directory `Lab_09`. If you want to write code in another directory, you will need to specify the relative path to that directory, starting from the root of this project.

#### Configure `run` and `debug` steps
As mentioned before, we are assembling our code from multiple sources. For the `run` configuration we need to specify the following steps.

```json
{
    ...
    "run": [
                "TASM /zi /la lw9e1.asm",
                "TASM /zi /la proclib.asm",
                "TLINK /v/3 lw9e1.obj proclib.obj",
                ">lw9e1.exe"
    ],
    "debug": [
                "TASM /zi /la lw9e1.asm",
                "TASM /zi /la proclib.asm",
                "TLINK /v/3 lw9e1.obj proclib.obj",
                "TD lw9e1.exe"
    ]
    ...
}
```

You can see above that we now specify the exact names of the files we want to assmeble. **You will need to change these names, according to the ones of your files**.



