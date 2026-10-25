class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261025.180703.b765b2a"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261025-180703-b765b2a/marvel-darwin-arm64"
    sha256 "529e3cabb536b70d59a45ac1a6d17d51ce7d2edb4edd915bb6cc1a6cab220314"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261025-180703-b765b2a/marvel-darwin-amd64"
    sha256 "da379075211cd82865f14d8279355b0a19bd7dcc758173dba26a3bcbb2ee60a1"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261025-180703-b765b2a/marvel-linux-arm64"
    sha256 "d8f176eedfaf0611d3512227ee3e8d1cd1dcc7fcd70fc4544a58cbc626d77d25"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261025-180703-b765b2a/marvel-linux-amd64"
    sha256 "9be526c812c64db8fc2ae0689ae2baa5ef7d6d5afbe4efb617b325a35b6997f3"
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
