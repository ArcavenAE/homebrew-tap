class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20260829.003013.6d11af9"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260829-003013-6d11af9/marvel-darwin-arm64"
    sha256 "a2dbee12a3f5a9ebe6af7575c079d48e2439db4c161801adebb5e9a771df0cb8"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260829-003013-6d11af9/marvel-darwin-amd64"
    sha256 "1ed28669131767bb3cf23d1160d5bc2861bc5e80aa89365aed1bbacf156af368"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260829-003013-6d11af9/marvel-linux-arm64"
    sha256 "c52b8565bb58edc016fa709eee6aa446d22db00aa734587cdae7ee18a6099f5f"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260829-003013-6d11af9/marvel-linux-amd64"
    sha256 "2e2555b5dab14d6795f1c53c2274c7605158639729a54f628503b5a87384d8c3"
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
