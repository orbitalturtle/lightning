git rm .gitmodules
git rm --cached external/jsmn external/libsodium external/libbacktrace external/libwally-core
rm -rf external/jsmn external/libsodium external/libbacktrace external/libwally-core

rm -rf .git/modules/external/jsmn .git/modules/external/libsodium .git/modules/external/libbacktrace .git/modules/external/libwally-core

git commit -am "scripted: Remove submodules for materialization"

git clone --recursive https://github.com/zserge/jsmn external/jsmn
(cd external/jsmn; git checkout 18e9fe42cbfe21d65076f5c77ae2be379ad1270f)

git clone --recursive https://github.com/ianlancetaylor/libbacktrace.git external/libbacktrace
(cd external/libbacktrace; git checkout 5a99ff7fed66b8ea8f09c9805c138524a7035ece)

git clone --recursive https://github.com/jedisct1/libsodium.git external/libsodium
(cd external/libsodium; git checkout 675149b9b8b66ff44152553fb3ebf9858128363d)

git clone --recursive https://github.com/ElementsProject/libwally-core.git external/libwally-core
(cd external/libwally-core; git checkout 50042b527cc0ee6ef27c8620d2d2550157a0958b )

rm -rf external/jsmn/.git external/libsodium/.git/ external/libbacktrace/.git/ external/libwally-core/.git

# Move gitignore out of the way so the following adds work
mv .gitignore .gitignore.bak

git add external/jsmn
git add external/libsodium
git add external/libbacktrace
git add external/libwally-core

mv .gitignore.bak .gitignore

git commit -am "scripted: Materialize submodules"
