class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20260928.031131.284193d"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260928-031131-284193d/marvel-darwin-arm64"
    sha256 "8e1b8940f4771e3e25019d1f329efcd26b94567c313f25ac19accd50ba51f086"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260928-031131-284193d/marvel-darwin-amd64"
    sha256 "d565e0725f091088968c911e704975ce323333d8a42e9fac13a7cca045809d41"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260928-031131-284193d/marvel-linux-arm64"
    sha256 "537e05fc9d563bc3019afe195fb3ee1fd9e9882bed1db33cce171fefe3be8ffc"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260928-031131-284193d/marvel-linux-amd64"
    sha256 "201575e6bbdbb995b92f7946a857c250b7e86a59d14311a70ec3a1c248493df0"
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
