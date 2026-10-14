class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261014.202748.5341295"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261014-202748-5341295/marvel-darwin-arm64"
    sha256 "f0e8e4469f7aad3f5cb8c0fa2ca8ddc4dcf1388484cc852de4d508da8c30d0e1"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261014-202748-5341295/marvel-darwin-amd64"
    sha256 "0e3c617dca7ab34c97a47b43a5958f0817b97ba324ebbb441dd9cccde929895a"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261014-202748-5341295/marvel-linux-arm64"
    sha256 "ac8bca430435c990193700d43ad82a1451689e91819e6c7a4f56ae6e0fd78671"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261014-202748-5341295/marvel-linux-amd64"
    sha256 "039d7027582f62f79249f546bdded29190c40a8fbcb8d982fac10297a6d2b694"
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
