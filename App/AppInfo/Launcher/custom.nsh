${SegmentFile}

Var CustomLastLocalAPPDATADirectory

${SegmentPrePrimary}
	; Get the last documents directory
	ReadINIStr $CustomLastLocalAPPDATADirectory $EXEDIR\Data\settings\MyPaintPortableSettings.ini MyPaintPortableSettings LastLocalAPPDATADirectory
	
	${If} $CustomLastLocalAPPDATADirectory == ""
		StrCpy $CustomLastLocalAPPDATADirectory "??????????NonsenseString??????????"
	${EndIf}

	StrCpy $0 $CustomLastLocalAPPDATADirectory
	${SetEnvironmentVariable} "CustomLastLocalAPPDATADirectory" $0
	
	${WordReplace} $0 "\" "\\" "+" $1
	
	${SetEnvironmentVariable} "CustomLastLocalAPPDATADirectory:DoubleBackslash" $1
	
	ExpandEnvStrings $0 "$LOCALAPPDATA"
	
	; Store current local APPDATA directory for next time
	WriteINIStr $EXEDIR\Data\settings\MyPaintPortableSettings.ini MyPaintPortableSettings LastLocalAPPDATADirectory $0
!macroend
