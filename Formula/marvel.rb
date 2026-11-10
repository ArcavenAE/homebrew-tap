class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261110.154643.055b9f0"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261110-154643-055b9f0/marvel-darwin-arm64"
    sha256 "09581399609bec006d0588159d8c67014e90a717c05335952ff988c85bd61e7f"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261110-154643-055b9f0/marvel-darwin-amd64"
    sha256 "41c56915a04a9e3b22b566d1f6d13455aeea431a4a417f65677c8972b3b79ebb"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261110-154643-055b9f0/marvel-linux-arm64"
    sha256 "a0a72e846a7c46d8a132cd07ee0c1333ec8c090dca19921e7be920acf326375c"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261110-154643-055b9f0/marvel-linux-amd64"
    sha256 "555883c08c71c316bb522dc21037e9798408e9b32f1ff90d5956df72b670a66d"
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
