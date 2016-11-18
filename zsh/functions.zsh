# List content of archive but don't extract
function ll-archive() {
    if [ -f "$1" ]; then
        case "$1" in
            *.tar.bz2|*.tbz2|*.tbz)  tar -jtf "$1"     ;;
            *.tar.gz)                tar -ztf "$1"     ;;
            *.tar|*.tgz|*.tar.xz)    tar -tf  "$1"     ;;
            *.gz)                    gzip -l  "$1"     ;;
            *.rar)                   rar vb   "$1"     ;;
            *.zip)                   unzip -l "$1"     ;;
            *.7z)                    7z l     "$1"     ;;
            *.lzo)                   lzop -l  "$1"     ;;
            *.xz|*.txz|*.lzma|*.tlz) xz -l    "$1"     ;;
        esac
    else
        echo "Sorry, '$1' is not a valid archive."
        echo "Valid archive types are:"
        echo "tar.bz2, tar.gz, tar.xz, tar, gz,"
        echo "tbz2, tbz, tgz, lzo, rar"
        echo "zip, 7z, xz and lzma"
    fi
}

# Extract an archive
function extract() {
    if [ -z "$2" ]; then 2="."; fi
    if [ -f "$1" ] ; then
        case "$1" in
            *.tar.bz2|*.tgz|*.tbz2|*.tbz) mkdir -v "$2" 2>/dev/null ; tar xvjf "$1" -C "$2"  ;;
            *.tar.gz)                     mkdir -v "$2" 2>/dev/null ; tar xvzf "$1" -C "$2"  ;;
            *.tar.xz)                     mkdir -v "$2" 2>/dev/null ; tar xvJf "$1"          ;;
            *.tar)                        mkdir -v "$2" 2>/dev/null ; tar xvf  "$1" -C "$2"  ;;
            *.rar)                        mkdir -v "$2" 2>/dev/null ; 7z x     "$1" -o"$2"   ;;
            *.zip)                        mkdir -v "$2" 2>/dev/null ; unzip    "$1" -d "$2"  ;;
            *.7z)                         mkdir -v "$2" 2>/dev/null ; 7z x     "$1" -o"$2"   ;;
            *.lzo)                        mkdir -v "$2" 2>/dev/null ; lzop -d  "$1" -p "$2"  ;;
            *.gz)                         gunzip "$1"                                        ;;
            *.bz2)                        bunzip2 "$1"                                       ;;
            *.Z)                          uncompress "$1"                                    ;;
            *.xz|*.txz|*.lzma|*.tlz)      xz -d "$1"                                         ;;
            *)
        esac
    else
        echo "Sorry, '$1' could not be decompressed."
        echo "Usage: extract <archive> <destination>"
        echo "Example: extract PKGBUILD.tar.bz2 ."
        echo "Valid archive types are:"
        echo "tar.bz2, tar.gz, tar.xz, tar, bz2,"
        echo "gz, tbz2, tbz, tgz, lzo,"
        echo "rar, zip, 7z, xz and lzma"
    fi
}

# compress a file or folder
function compress() {
    case "$1" in
        tar.bz2|.tar.bz2) tar cvjf "${2%%/}.tar.bz2" "${2%%/}/" ;;
        tbz2|.tbz2)       tar cvjf "${2%%/}.tbz2" "${2%%/}/"    ;;
        tbz|.tbz)         tar cvjf "${2%%/}.tbz" "${2%%/}/"     ;;
        tar.xz)           tar cvJf "${2%%/}.tar.xz" "${2%%/}/"  ;;
        tar.gz|.tar.gz)   tar cvzf "${2%%/}.tar.gz" "${2%%/}/"  ;;
        tgz|.tgz)         tar cvjf "${2%%/}.tgz" "${2%%/}/"     ;;
        tar|.tar)         tar cvf  "${2%%/}.tar" "${2%%/}/"     ;;
        rar|.rar)         rar a "${2}.rar" "$2"                 ;;
        zip|.zip)         zip -r -9 "${2}.zip" "$2"             ;;
        7z|.7z)           7z a "${2}.7z" "$2"                   ;;
        lzo|.lzo)         lzop -v "$2"                          ;;
        gz|.gz)           gzip -r -v "$2"                       ;;
        bz2|.bz2)         bzip2 -v "$2"                         ;;
        xz|.xz)           xz -v "$2"                            ;;
        lzma|.lzma)       lzma -v "$2"                          ;;
        *)                echo "Compress a file or directory."
            echo "Usage:   compress <archive type> <filename>"
            echo "Example: ac tar.bz2 PKGBUILD"
            echo "Please specify archive type and source."
            echo "Valid archive types are:"
            echo "tar.bz2, tar.gz, tar.gz, tar, bz2, gz, tbz2, tbz,"
            echo "tgz, lzo, rar, zip, 7z, xz and lzma." ;;
    esac
}

# Recursively fix dir/file permissions on a given directory
function fix-dir-perm() {
    if [ -d $1 ]; then
        find $1 -type d -exec chmod 755 {} \;
        find $1 -type f -exec chmod 644 {} \;
    else
        echo "$1 is not a directory."
    fi
}

# Create a directory and "cd" into it
function mkdir-cd() {
    mkdir "${1}" && cd "${1}"
}

# Find files using ZSH globbing
function glob-find-files-by-name() {
    ll **/*(#i)($1)*(.)
}

# Backup a file
function backup-file() {
    cp -r "$1"{,.bak};
}
