class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261002.205407.22db0fc"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261002-205407-22db0fc/marvel-darwin-arm64"
    sha256 "b698d0bb447e1dce0516e5d21bf488dbfd4945c4ba6081a96af664429181b32e"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261002-205407-22db0fc/marvel-darwin-amd64"
    sha256 "57190ec0a18e47a13c17a18e05d73262718ccdb829e78d050a09ba6d1a018429"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261002-205407-22db0fc/marvel-linux-arm64"
    sha256 "f6ecfa018b5b0a39929c1a95d665371448567ca39e4c9a32771679da48b4317b"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261002-205407-22db0fc/marvel-linux-amd64"
    sha256 "64e2b3b072d616afb5bfff42821cfceb3ac479e418e9d6c14e58ad8467603664"
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
