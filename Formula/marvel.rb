class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261112.160543.84a39f8"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261112-160543-84a39f8/marvel-darwin-arm64"
    sha256 "b46cad6a8b1bfdc454196dde2e7c34ddf5c95e7ed85d83b4b05c66901f92f560"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261112-160543-84a39f8/marvel-darwin-amd64"
    sha256 "5649ebcce19c694c00921ebc0b80bbda3e7362b4a27ceb2dd80de38200087d00"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261112-160543-84a39f8/marvel-linux-arm64"
    sha256 "5390f99c3e944d9d4f45678ee58829f521e7df19191308715873d3955256812d"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261112-160543-84a39f8/marvel-linux-amd64"
    sha256 "3f2209ba2de7726ff702f5eaef5a53827d4cf0830411c95c633145ecb3dd8d05"
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
