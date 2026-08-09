class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20260809.071011.5a6b7bc"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260809-071011-5a6b7bc/marvel-darwin-arm64"
    sha256 "a741c5006f13584b80b349b3071ecef11d9729cf3822bfd0b606c3d2c6ab7360"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260809-071011-5a6b7bc/marvel-darwin-amd64"
    sha256 "cf8c3065632f3cfc9cc79f68a9a54669886d84bbff17e003fd358132cc3a305b"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260809-071011-5a6b7bc/marvel-linux-arm64"
    sha256 "ff108c01a1eea75b3b1ab0f1aac8c364ded134d56bc5b414d7cab909795fe8b5"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260809-071011-5a6b7bc/marvel-linux-amd64"
    sha256 "14c4c09d4c592c547fd0fb08972e6dae7ae5f271a7eda7df697b852d20febf88"
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
