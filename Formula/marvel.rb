class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261127.203125.53eb486"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261127-203125-53eb486/marvel-darwin-arm64"
    sha256 "97820b5536f1d46e9539348743e0b0a01853095208a265e0129de2e4ef18b1c9"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261127-203125-53eb486/marvel-darwin-amd64"
    sha256 "3fc360b4dc7ae2428af32b39f55a9ec0642cdae94466f2605ea91c8c1863562b"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261127-203125-53eb486/marvel-linux-arm64"
    sha256 "209ce3f9d99d7639049d7c99b2673b4e3384a84127de6c4cd119d15d58036d48"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261127-203125-53eb486/marvel-linux-amd64"
    sha256 "93a9a2641c2adb229712a86747def2a83bdae887aa051c5539652841673a546a"
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
