# SwiftHarfBuzz

An early attempt to wrap Haff Buzz using gir2swift.

## Usage:
Update package via
```
$ swift package update
```

Run gir2swift via `newgen.sh` file. The file is not supposed to create an alternative generation script, it is name "new" because it uses new `gir2swift` features and should be dropped after `SwiftHarfBuzz` is integrated into the ecosystem.
```
$ ./newgen.sh
```

Build 
```
$ swift build -Xswiftc -suppress-warnings
```

At this time, build does not pass. The error log I am getting is in `out.file` (Ubuntu MATE 21.10). There are two main categories of issues:
 - some constants seem to be missing
 - types `FT_Facer` and `hb_language_t` (`hb_language_t` is marked in `gir` as `disguised="1"`) are wrapped in extra level of Optional.

out.file:788
```
[86/87] Compiling HarfBuzz HarfBuzz-0.0-feature_t-glyph_extents_t.swift
/home/mikolas/Developer/SwiftHarfBuzz/Sources/HarfBuzz/HarfBuzz-0.0-constants.swift:17:31: error: cannot find 'HB_LANGUAGE_INVALID' in scope
public let LANGUAGE_INVALID = HB_LANGUAGE_INVALID // 0
                              ^~~~~~~~~~~~~~~~~~~
/home/mikolas/Developer/SwiftHarfBuzz/Sources/HarfBuzz/HarfBuzz-0.0-feature_t-glyph_extents_t.swift:1954:16: error: value of optional type 'FT_Face?' (aka 'Optional<UnsafeMutablePointer<FT_FaceRec_>>') must be unwrapped to a value of type 'FT_Face' (aka 'UnsafeMutablePointer<FT_FaceRec_>')
        return rv
               ^
```
