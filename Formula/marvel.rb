class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261111.014323.5072736"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261111-014323-5072736/marvel-darwin-arm64"
    sha256 "ced3382f69db5bd43079cee98d5e45efb7349e469336471c09b9bbe3d6a870e4"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261111-014323-5072736/marvel-darwin-amd64"
    sha256 "fbf6f30701a598b61d511c7bc22dfe4b0ab15e44496a248de2aa91701d592f4d"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261111-014323-5072736/marvel-linux-arm64"
    sha256 "3252122856df3ddf162b75223f3c121b82eab1ee0d1039a9e4f4183376a254cd"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261111-014323-5072736/marvel-linux-amd64"
    sha256 "795887b781ddee725e7e6d5c261ebb3429e3fc3ab0ee5f10e97f4e9a94683aa0"
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
