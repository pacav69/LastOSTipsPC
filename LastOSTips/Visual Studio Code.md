Color tip
ref [here](https://stackoverflow.com/questions/35926381/change-highlight-text-color-in-visual-studio-code)



this is the settings.json content:
		
		settings.json
		
		{
		    "editor.cursorStyle": "block",
		    "editor.minimap.showSlider": "always",
		    "files.autoSave": "afterDelay",
		    "editor.bracketPairColorization.independentColorPoolPerBracketType": true,
		    "editor.hover.above": false,
		    "editor.hover.enabled": false,
		    "markdown-pdf.highlightStyle": "arta.css",
		    "workbench.preferredHighContrastLightColorTheme": "Abyss",
		    "workbench.colorCustomizations": {
		
		        "editor.selectionBackground": "#35500b",
		        "editor.selectionHighlightBackground": "#d47d47"
				"editor.findMatchBackground": "#c7225ea8", //Current SEARCH MATCH
		        "editor.findMatchHighlightBackground": "#39b617a1" //Other SEARCH MATCHES
		    
		    }
		}

under  workbench.colorCustomizations

add these two lines 


        "editor.selectionBackground": "#35500b",
        "editor.selectionHighlightBackground": "#d47d47"

this will change the color of the highlighted text in VSC


alternative colors

			"editor.selectionBackground": "#600aab",
        "editor.selectionHighlightBackground": "#d47d47",