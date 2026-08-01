class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20260801.043357.4281899"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260801-043357-4281899/marvel-darwin-arm64"
    sha256 "75ff04772944158fa7ee754398364aeb643cdab9e8020062fdfe8af4342708ed"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260801-043357-4281899/marvel-darwin-amd64"
    sha256 "9d1ce5ee20af86e6ba868d23ebcd3e701ab81b46c5b47f6090c2b5b580d4f2dd"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260801-043357-4281899/marvel-linux-arm64"
    sha256 "4b826b54a30dd5719d4be0147fa776951810cf6a14032e1b6789ebc984cd2066"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260801-043357-4281899/marvel-linux-amd64"
    sha256 "b2defb687eb5d826f9f23e51762fecb8a81774da4bfb5ea5face39aa51609193"
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
