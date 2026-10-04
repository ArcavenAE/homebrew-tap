class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261004.044048.e45deb4"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261004-044048-e45deb4/marvel-darwin-arm64"
    sha256 "fbe5941e03d93e51a8e6912b0913ea4f1874d20445816e8bd46888ab7bda7b41"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261004-044048-e45deb4/marvel-darwin-amd64"
    sha256 "c28427af3b8494e4d472f59eacbe059fc8173c1264c368e5929e7229f388500d"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261004-044048-e45deb4/marvel-linux-arm64"
    sha256 "3dc231f244ff68ee287e1ba0cda7cb9bd3288b38c91b6a9ce05088d99249a06f"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261004-044048-e45deb4/marvel-linux-amd64"
    sha256 "ec68b7f03d5be81f61ee29c5e4a26e1014ecf5d958235dc4b1e3aad00a567dbe"
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
