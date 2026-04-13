class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20260413.063500.9abee5b"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260413-063500-9abee5b/marvel-darwin-arm64"
    sha256 "6c771463ee5168e6bb610d4b8cae1a201b07bd6384e1af604d31627239213653"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260413-063500-9abee5b/marvel-darwin-amd64"
    sha256 "55f922596d47ec65283569331b3edd8916fcbeb26f6afedd76e82d5e1c40d75c"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260413-063500-9abee5b/marvel-linux-amd64"
    sha256 "656c0a197fcbaa46c0bef3e78850739573bad2ed99d629a5318ff1d73e47d421"
  end

  def install
    if OS.mac? && Hardware::CPU.arm?
      bin.install "marvel-darwin-arm64" => "marvel"
    elsif OS.mac?
      bin.install "marvel-darwin-amd64" => "marvel"
    elsif OS.linux?
      bin.install "marvel-linux-amd64" => "marvel"
    end
  end

  test do
    assert_match "marvel", shell_output("#{bin}/marvel version 2>&1")
  end
end
