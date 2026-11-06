class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261106.070841.879791f"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261106-070841-879791f/marvel-darwin-arm64"
    sha256 "6cdef86e4af5d476fcab7fe3f65297454cfcf164eff65e21c724e54f9ee2b71f"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261106-070841-879791f/marvel-darwin-amd64"
    sha256 "74b9bb05883913a70c1f479c30ee9454af6836f41050f5d7630e58af4e5181a4"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261106-070841-879791f/marvel-linux-arm64"
    sha256 "b46f117bb9f2a924a6c7522b46c432fafb8c8c57435f04517fa3e0d5fbb26ddd"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261106-070841-879791f/marvel-linux-amd64"
    sha256 "a08283d4da3bd51e6b668837f5cd019198b04941e6b581726c85668c63a74596"
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
