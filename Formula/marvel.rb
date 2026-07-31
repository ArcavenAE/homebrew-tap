class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20260731.225852.f862b65"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260731-225852-f862b65/marvel-darwin-arm64"
    sha256 "d614a731159b47265694f4fea56cd70ec7b7285c3af6ab347b8e91f11add6204"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260731-225852-f862b65/marvel-darwin-amd64"
    sha256 "f644fde9c3931f1b7ebf99ae51fc9231a5408127fe1e8844104138ccf16b49a9"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260731-225852-f862b65/marvel-linux-arm64"
    sha256 "a657c71cb1408992b3b157850eac3175ff4a51034ab120b354260500c4fb9368"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260731-225852-f862b65/marvel-linux-amd64"
    sha256 "76222c8e09ad41cf86c0cfab72715caa4e73d02cc127a3eeaad7e8f60ceb89bd"
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
