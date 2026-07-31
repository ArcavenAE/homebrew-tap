class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20260731.232524.2dae504"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260731-232524-2dae504/marvel-darwin-arm64"
    sha256 "374cdaadc2026e3837312bef9dd424ebf9b798b2be3e7e0082d5d53aa388957a"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260731-232524-2dae504/marvel-darwin-amd64"
    sha256 "fb9f854d8136895c9ea869c954180c081248490fae7c02f396938d63dbfb57d4"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260731-232524-2dae504/marvel-linux-arm64"
    sha256 "06229f3bb528eacdd916c6c379b0d7d5ae4b068ea6600c8928ff8413be10d601"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260731-232524-2dae504/marvel-linux-amd64"
    sha256 "648ecb671adf2a5faa14b00b0de8a991c034c0f67a9df7c54eadb747c8a3bbd6"
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
