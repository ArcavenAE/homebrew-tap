class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20260917.211136.6aabb8b"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260917-211136-6aabb8b/marvel-darwin-arm64"
    sha256 "e306fc69eccdbcac1e2248cd0e9af7e74898ea371f95ae84c04554e6005b9c83"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260917-211136-6aabb8b/marvel-darwin-amd64"
    sha256 "32be4b00c5fc8a4534b8812cb27652d7a714a2be2ce29e388342a060276de4ed"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260917-211136-6aabb8b/marvel-linux-arm64"
    sha256 "15057c9c9a01e0f2ac82baf91540665222e966482e5efa0e9607c2fbc4987a85"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260917-211136-6aabb8b/marvel-linux-amd64"
    sha256 "ca91e119eeaaf0a498da6134fd5c233fa8f44b88001edcc45dc2559b7630d19a"
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
