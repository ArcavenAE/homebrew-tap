class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261127.014958.c6500ad"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261127-014958-c6500ad/marvel-darwin-arm64"
    sha256 "a53052f9803a732fcb0eb4c8e563178ce7034ae14f5d6e839699a51eac70a11a"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261127-014958-c6500ad/marvel-darwin-amd64"
    sha256 "4a39b07995a582661d98519cc384f99363e00b02a961d23251acc4e9337148ba"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261127-014958-c6500ad/marvel-linux-arm64"
    sha256 "4f61964d9c340ea9579327d1c90598a7cf644badf9250b8c2476ef23d201c4c1"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261127-014958-c6500ad/marvel-linux-amd64"
    sha256 "61bd70799cd4c050dbe2d63e9fbd535c8f23e45fd0c6c61cea542a5689f8ef03"
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
