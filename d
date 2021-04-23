[1mdiff --git a/Makefile b/Makefile[m
[1mindex 3915a7f..9ef211b 100644[m
[1m--- a/Makefile[m
[1m+++ b/Makefile[m
[36m@@ -2,14 +2,14 @@[m
 CC = cc[m
 [m
 # For mkfn with stb_truetype.h[m
[31m-CFLAGS = -O2 -Wall -DSTB_TRUETYPE_IMPLEMENTATION[m
[31m-LDFLAGS = -lm[m
[31m-MKFN = mkfn_stb.o[m
[32m+[m[32m#CFLAGS = -O2 -Wall -DSTB_TRUETYPE_IMPLEMENTATION[m
[32m+[m[32m#LDFLAGS = -lm[m
[32m+[m[32m#MKFN = mkfn_stb.o[m
 [m
 # For mkfn with freetype library[m
[31m-#CFLAGS = -Wall -O2 `pkg-config --cflags freetype2`[m
[31m-#LDFLAGS = `pkg-config --libs freetype2`[m
[31m-#MKFN = mkfn_ft.o[m
[32m+[m[32mCFLAGS = -Wall -O2 `pkg-config --cflags freetype2`[m
[32m+[m[32mLDFLAGS = `pkg-config --libs freetype2`[m
[32m+[m[32mMKFN = mkfn_ft.o[m
 [m
 all: mkfn[m
 %.o: %.c[m
[1mdiff --git a/chars.h b/chars.h[m
[1mindex 776a3f1..97b2d85 100644[m
[1m--- a/chars.h[m
[1m+++ b/chars.h[m
[36m@@ -132,6 +132,27 @@[m [mstatic int chars[][2] = {[m
 	{0xac00, 0xd7ff},	/* Hangul ... */[m
 	{0xd800, 0xdb7f},	/* High Surrogates */[m
 	{0xdc00, 0xdfff},	/* Low Surrogates */[m
[32m+[m
[32m+[m	[32m{0x23fb, 0x23fe},	/* Nerd Font : IEC Power Symbols */[m
[32m+[m	[32m{0x2665, 0x2665},	/* Nerd Font : Octicons */[m
[32m+[m	[32m{0x26a1, 0x26a1},	/* Nerd Font : Octicons */[m
[32m+[m	[32m{0x2b58, 0x2b58},	/* Nerd Font : IEC Power Symbols */[m
[32m+[m	[32m{0xe000, 0xe00d},	/* Nerd Font : Pomicons */[m
[32m+[m	[32m{0xe0a3, 0xe0a3},	/* Nerd Font : Powerline Extra Symbols */[m
[32m+[m	[32m{0xe0b4, 0xe0c8},	/* Nerd Font : Powerline Extra Symbols */[m
[32m+[m	[32m{0xe0ca, 0xe0ca},	/* Nerd Font : Powerline Extra Symbols */[m
[32m+[m	[32m{0xe0cc, 0xe0d2},	/* Nerd Font : Powerline Extra Symbols */[m
[32m+[m	[32m{0xe0d4, 0xe0d4},	/* Nerd Font : Powerline Extra Symbols */[m
[32m+[m	[32m{0xe200, 0xe2a9},	/* Nerd Font : Font Awesome Extension */[m
[32m+[m	[32m{0xe300, 0xe3eb},	/* Nerd Font : Weather */[m
[32m+[m	[32m{0xe5fa, 0xe62b},	/* Nerd Font : Seti-UI + Custom */[m
[32m+[m	[32m{0xe700, 0xe7c5},	/* Nerd Font : Devicons */[m
[32m+[m	[32m{0xf000, 0xf2e0},	/* Nerd Font : Font Awesome */[m
[32m+[m	[32m{0xf27c, 0xf27c},	/* Nerd Font : Octicons */[m
[32m+[m	[32m{0xf300, 0xf313},	/* Nerd Font : Font Logos */[m
[32m+[m	[32m{0xf400, 0xf4a8},	/* Nerd Font : Octicons */[m
[32m+[m	[32m{0xf500, 0xfd46},	/* Nerd Font : Material Design Icons */[m
[32m+[m
 	{0xf900, 0xfaff},	/* CJK Compatibility Ideographs */[m
 	{0xfb00, 0xfb4f},	/* Alphabetic Presentation Forms */[m
 	{0xfb50, 0xfdff},	/* Arabic Presentation Forms-A */[m
[1mdiff --git a/mkfn_ft.c b/mkfn_ft.c[m
[1mindex 85e7178..bcb403f 100644[m
[1m--- a/mkfn_ft.c[m
[1m+++ b/mkfn_ft.c[m
[36m@@ -71,6 +71,7 @@[m [mint mkfn_font(char *path, char *spec)[m
 	}[m
 	if (FT_Set_Char_Size(*face, 0, size * 64, hdpi, vdpi))[m
 		return 1;[m
[32m+[m	[32mfprintf(stderr, "Got : %d\n", FT_Get_Char_Index(*face, (FT_ULong)0xf85a));[m
 	fn_desc[fn_cnt] = facedescender(*face);[m
 	fn_cnt++;[m
 	return 0;[m
