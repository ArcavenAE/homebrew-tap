class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261121.024344.a007c4a"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261121-024344-a007c4a/marvel-darwin-arm64"
    sha256 "edbcc1acb92dacc474cee5c5c8324fbe646a363b8281b9d53e07405a12a7c884"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261121-024344-a007c4a/marvel-darwin-amd64"
    sha256 "aecc7b2c3c1360b76cd96f51d5ea56a5070a1e6c8caad8955cfd0d7b5732317f"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261121-024344-a007c4a/marvel-linux-arm64"
    sha256 "ec7b1835bd8cf4b3a60556994e9441573a828dba17581efeca794966ea4e6fa7"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261121-024344-a007c4a/marvel-linux-amd64"
    sha256 "233602ac04c4bbf99e8c2666f71ec72686fe691be216803993f88b63c3d7016b"
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
