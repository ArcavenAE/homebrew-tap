class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261102.044726.f5489f8"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261102-044726-f5489f8/marvel-darwin-arm64"
    sha256 "ac880786dd5b09cd045b0463601a857728f0a98ade61ff9e9e9a599b9a9d7c8f"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261102-044726-f5489f8/marvel-darwin-amd64"
    sha256 "6763504b3e5e66affc0de22e5617e3bb3e806880dcfeb99cfefbf676323f0ccf"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261102-044726-f5489f8/marvel-linux-arm64"
    sha256 "57eb09994fabd5de1bd438e06f3b6fb93b53b0447975ac1b49869f9966357f9a"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261102-044726-f5489f8/marvel-linux-amd64"
    sha256 "584f4bc709566e3d221a7c75e35a53f3b70de211d37d0b079e121c57c80d4c91"
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
