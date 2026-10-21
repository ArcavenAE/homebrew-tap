class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261021.184411.7c3245a"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261021-184411-7c3245a/marvel-darwin-arm64"
    sha256 "4122fb53219ed3f25c6b4a4780be0c78415e078b83f68c9070601f0888633292"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261021-184411-7c3245a/marvel-darwin-amd64"
    sha256 "4a68583d1e92c832d2ca0be1975c083a7a64800f1c384fc70048559e06ce51a7"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261021-184411-7c3245a/marvel-linux-arm64"
    sha256 "eeb90fc26d0d282cd0cc1db4066dc2afc9f149140eea3335cc4d7dc18e0eb950"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261021-184411-7c3245a/marvel-linux-amd64"
    sha256 "86f492c62f2588d2733116b70151de6ac266e2658bc32c8b1577324962526cfd"
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
