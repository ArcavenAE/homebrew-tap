class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261025.165211.f004323"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261025-165211-f004323/marvel-darwin-arm64"
    sha256 "c52fef9dfc2b951d7c3c406a23762cb3307dc5ebe2405bc6d7a4924adf73e253"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261025-165211-f004323/marvel-darwin-amd64"
    sha256 "8c9fae2587f803e5ec9ee05fee7311adb58cf3954684766ae90b009130ad9bae"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261025-165211-f004323/marvel-linux-arm64"
    sha256 "245fa6a4527237bf00f872362a5a960c71f8858114e962eea7d3a4e8cf002188"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261025-165211-f004323/marvel-linux-amd64"
    sha256 "a13a1a6bb4854738bbb48e09c430faf70a3f6dec85ad96d5ec049751ab518354"
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
