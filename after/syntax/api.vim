if exists("b:current_syntax")
  finish
endif

syntax keyword ApiKeyword syntax import info type service
syntax keyword ApiAnnotation @server @handler @doc @middleware
syntax keyword ApiType string int int8 int16 int32 int64 uint uint8 uint16 uint32 uint64 bool float32 float64
syntax match ApiComment "//.*$"
syntax region ApiComment start="/\*" end="\*/"
syntax region ApiString start=+"+ skip=+\\.+ end=+"+
syntax match ApiRoute "\v<(get|post|put|delete|patch|head|options)>"
syntax match ApiTag /`[^`]*`/
syntax match ApiNumber "\v<\d+>"
syntax match ApiDelimiter "[{}()\[\],:]"

highlight default link ApiKeyword Keyword
highlight default link ApiAnnotation PreProc
highlight default link ApiType Type
highlight default link ApiComment Comment
highlight default link ApiString String
highlight default link ApiRoute Statement
highlight default link ApiTag String
highlight default link ApiNumber Number
highlight default link ApiDelimiter Delimiter

let b:current_syntax = "api"
