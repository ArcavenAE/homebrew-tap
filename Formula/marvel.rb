class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261105.185022.7c1f66d"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261105-185022-7c1f66d/marvel-darwin-arm64"
    sha256 "ca85b0d287d13456ea33b394bb800ed191424673d586c501354bfd564332e260"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261105-185022-7c1f66d/marvel-darwin-amd64"
    sha256 "77199641d893ad2254534d22ee4126a86fd7f8ee3243cf9f7d3546358c309ea9"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261105-185022-7c1f66d/marvel-linux-arm64"
    sha256 "8dda99f7b2b34395f7106a5f7feeef12e4c70d792a4287aa064ba17cec7dc1df"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261105-185022-7c1f66d/marvel-linux-amd64"
    sha256 "96def47ece85255fd0ca1835063a2b5efbff5783e4d03b0131afec82c38e67e1"
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
