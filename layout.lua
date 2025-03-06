-- (done) read lines
-- (done) chords list & map
-- TODO: shifted chords (requires anti-map)
-- TODO: render to Rust

local fname = args[1] or 'gray1-2b2.txt'
for l in io.lines(fname) do
    local chord, key = l:match '^([_%v^]+)%s+([^%s]+)$'
    if chord then
        chords[#chords+1] = {chord=chord, key=key}  -- order from file
        chords[chord] = key
    end
end

print [[
impl Layers {
]]

local layers = {chords}  -- TODO more
for i, l in ipairs(layers) do
    print(([[
    const_map!(
        LAYOUT%d, lookup%d(),
        (u8 => LayerOutcome<KeyWithFlags>) {
]]):format(i, i))
    for _, ch in ipairs(l) do
        print(([[
            chord!("%q") => Emit(Hit(%s)),  // %s
]]):format(ch.chord, ...))
    end
end

print [[
impl Layers {
]]
