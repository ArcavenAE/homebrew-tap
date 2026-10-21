class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261021.000816.c9919bc"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261021-000816-c9919bc/marvel-darwin-arm64"
    sha256 "4efcc2187a3239648cdc801b69426cafe0c51a638dd07ebc5dc999b6d9aac07c"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261021-000816-c9919bc/marvel-darwin-amd64"
    sha256 "534e4c54a8b2a4fb05247734e2245eba62749bd927342607599e2ed08a4313c8"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261021-000816-c9919bc/marvel-linux-arm64"
    sha256 "e2f89805515ec60c3c0d04f3298306b775c2fc858b8a289967a81d5d8febe139"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261021-000816-c9919bc/marvel-linux-amd64"
    sha256 "6e3e333e60536d3c7952da863031b314fcc3600321a1015e3f6ff82536d74920"
  end

  def install
    if OS.mac? && Hardware::CPU.arm?
      bin.install "marvel-darwin-arm64" => "marvel"
    elsif OS.mac?
      bin.install "marvel-darwin-amd64" => "marvel"
    elsif OS.linux? && Hardware::CPU.arm?
      bin.install "marvel-linux-arm64" => "marvel"
    elsif OS.linux?
      bin.install "marvel-linux-amd64" => "marvel"
    end
  end

  test do
    assert_match "marvel", shell_output("#{bin}/marvel version 2>&1")
  end
end
