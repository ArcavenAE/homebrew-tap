class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20260706.003938.cccc651"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260706-003938-cccc651/marvel-darwin-arm64"
    sha256 "9c327d87f002e586178e51abc474aa667e97093b368ba4d53d1d4456fb96496e"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260706-003938-cccc651/marvel-darwin-amd64"
    sha256 "369d2226c161b36d24d28d488d2bba7f037ed667f63dde415065bbc43eb4d744"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260706-003938-cccc651/marvel-linux-arm64"
    sha256 "7b36d67a021c02198d7915eb9f14da35d9c6b8010a21ebbdb896c73e858b3aa5"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260706-003938-cccc651/marvel-linux-amd64"
    sha256 "6c129398c9096353d43347128676a89aeeff035c98fc4a6bb63c9e045c27476a"
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
