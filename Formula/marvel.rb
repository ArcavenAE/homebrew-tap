class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261014.211504.10029bb"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261014-211504-10029bb/marvel-darwin-arm64"
    sha256 "a74c8770e1ba4f8452b105bde007270cbca5f634ec51c1ad4a53de96eac2b199"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261014-211504-10029bb/marvel-darwin-amd64"
    sha256 "a234fa97d4624591a1a38f4892f0a2efcbabf9468d75ad258ab30f7b78157de8"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261014-211504-10029bb/marvel-linux-arm64"
    sha256 "b80ddb012e5095c004350b17624f932d2cf5ef0df95b765307113e39020d7e2c"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261014-211504-10029bb/marvel-linux-amd64"
    sha256 "385708232ae8ee33cc1be504670e865fe9f0e7bef53b3031e48354e463281653"
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
