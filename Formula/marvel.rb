class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261008.212026.057d309"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261008-212026-057d309/marvel-darwin-arm64"
    sha256 "94b18866879c51342c666ac6ea604b61a9e8620df1eae47e47edd5cdd07bc45d"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261008-212026-057d309/marvel-darwin-amd64"
    sha256 "235621e39ebd5c936050ff6d9650693ef89c75ec0a62a1af6a13806841f19a4f"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261008-212026-057d309/marvel-linux-arm64"
    sha256 "45b5293694cd44a53522a4999d2314539ac20513b2a7619be9ead52af806e5c7"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261008-212026-057d309/marvel-linux-amd64"
    sha256 "41ea85a3a394b61fe7c135e904615f0d11791efe4c5d751c381f5e8ecba0f232"
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
