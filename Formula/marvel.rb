class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261123.185224.59b63f7"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261123-185224-59b63f7/marvel-darwin-arm64"
    sha256 "a1d4542dcdf828c487f1213970cb2350c24996a7faa74f1cbf99eaaa98659fc9"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261123-185224-59b63f7/marvel-darwin-amd64"
    sha256 "69a932e4e1f66af64c6d911a4cd9109e62c25b114ec3067d47336866af2f3184"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261123-185224-59b63f7/marvel-linux-arm64"
    sha256 "724e9ab3487a65b3ab9e6e2dcaf7a8ab7bd7eb99a2da9ee4cc51a5fe7d136a35"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261123-185224-59b63f7/marvel-linux-amd64"
    sha256 "1d9db7ac8622da3d9f86247050efe0637b7ce3db7e7300b3b4590e9cabe29a79"
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
